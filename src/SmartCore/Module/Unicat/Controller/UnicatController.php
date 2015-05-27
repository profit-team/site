<?php

namespace SmartCore\Module\Unicat\Controller;

use Knp\RadBundle\Controller\Controller;
use Pagerfanta\Adapter\DoctrineORMAdapter;
use Pagerfanta\Exception\NotValidCurrentPageException;
use Pagerfanta\Pagerfanta;
use SmartCore\Bundle\CMSBundle\Module\NodeTrait;
use SmartCore\Module\Unicat\Model\CategoryModel;
use SmartCore\Module\Unicat\Service\UnicatConfigurationManager;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class UnicatController extends Controller
{
    use NodeTrait;

    protected $configuration_id;

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction(Request $request)
    {
        return $this->categoryAction($request);
    }

    /**
     * @param Request $request
     * @param null $slug
     * @param int|null $page
     *
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     */
    public function categoryAction(Request $request, $slug = null, $page = null)
    {
        if (null === $page) {
            $page = $request->query->get('page', 1);
        }

        $ucm = $this->get('unicat')->getConfigurationManager($this->configuration_id);

        $requestedCategories = $ucm->findCategoriesBySlug($slug, $ucm->getDefaultStructure());

        foreach ($requestedCategories as $category) {
            $this->get('cms.breadcrumbs')->add($this->generateUrl('unicat.category', ['slug' => $category->getSlugFull()]).'/', $category->getTitle());
        }

        $lastCategory = end($requestedCategories);

        if ($lastCategory instanceof CategoryModel) {
            $this->get('html')->setMetas($lastCategory->getMeta());
            $childenCategories = $ucm->getCategoryRepository()->findBy([
                'is_enabled' => true,
                'parent'     => $lastCategory,
                'structure'  => $ucm->getDefaultStructure(),
            ], ['position' => 'ASC']);
        } else {
            $childenCategories = $ucm->getCategoryRepository()->findBy([
                'is_enabled' => true,
                'parent'     => null,
                'structure'  => $ucm->getDefaultStructure(),
            ], ['position' => 'ASC']);
        }

        $this->buuldFrontControlForCategory($ucm, $lastCategory);

        $pagerfanta = null;

        if ($slug) {
            if ($lastCategory) {
                $pagerfanta = new Pagerfanta(new DoctrineORMAdapter($ucm->getFindItemsInCategoryQuery($lastCategory)));
            }
        } elseif ($ucm->getConfiguration()->isInheritance()) {
            $pagerfanta = new Pagerfanta(new DoctrineORMAdapter($ucm->getFindAllItemsQuery()));
        }

        if (!empty($pagerfanta)) {
            $pagerfanta->setMaxPerPage($ucm->getConfiguration()->getItemsPerPage());

            try {
                $pagerfanta->setCurrentPage($page);
            } catch (NotValidCurrentPageException $e) {
                return $this->createNotFoundException('Такой страницы не найдено');
            }
        }

        return $this->render('UnicatModule::items.html.twig', [
            'mode'              => 'list',
            'attributes'        => $ucm->getAttributes(),
            'configuration'     => $ucm->getConfiguration(),
            'lastCategory'      => $lastCategory,
            'childenCategories' => $childenCategories,
            'pagerfanta'        => $pagerfanta,
            'slug'              => $slug,
        ]);
    }

    /**
     * @param UnicatConfigurationManager $ucm
     * @param CategoryModel|false $lastCategory
     *
     * @throws \Exception
     */
    protected function buuldFrontControlForCategory(UnicatConfigurationManager $ucm, $lastCategory = false)
    {
        $this->node->addFrontControl('create_item')
            ->setTitle('Добавить запись')
            ->setUri($this->generateUrl('unicat_admin.item_create_in_category', [
                'configuration'       => $ucm->getConfiguration()->getName(),
                'default_category_id' => empty($lastCategory) ? 0 : $lastCategory->getId(),
            ]));

        if (!empty($lastCategory)) {
            $this->node->addFrontControl('create_category')
                ->setIsDefault(false)
                ->setTitle('Создать категорию')
                ->setUri($this->generateUrl('unicat_admin.structure_with_parent_id', [
                    'configuration' => $ucm->getConfiguration()->getName(),
                    'parent_id'     => empty($lastCategory) ? 0 : $lastCategory->getId(),
                    'id'            => $lastCategory->getStructure()->getId(),
                ]));

            $this->node->addFrontControl('edit_category')
                ->setIsDefault(false)
                ->setTitle('Редактировать категорию')
                ->setUri($this->generateUrl('unicat_admin.category', [
                    'configuration' => $ucm->getConfiguration()->getName(),
                    'id'            => $lastCategory->getId(),
                    'structure_id'  => $lastCategory->getStructure()->getId(),
                ]));
        }

        $this->node->addFrontControl('manage_configuration')
            ->setIsDefault(false)
            ->setTitle('Управление каталогом')
            ->setUri($this->generateUrl('unicat_admin.configuration', ['configuration' => $ucm->getConfiguration()->getName()]));
    }

    /**
     * @param string|null $structureSlug
     * @param string $itemSlug
     *
     * @return Response
     */
    public function itemAction($structureSlug = null, $itemSlug)
    {
        $ucm = $this->get('unicat')->getConfigurationManager($this->configuration_id);

        $requestedCategories = $ucm->findCategoriesBySlug($structureSlug, $ucm->getDefaultStructure());

        foreach ($requestedCategories as $category) {
            $this->get('cms.breadcrumbs')->add($this->generateUrl('unicat.category', ['slug' => $category->getSlugFull()]).'/', $category->getTitle());
        }

        $lastCategory = end($requestedCategories);

        if ($lastCategory instanceof CategoryModel) {
            $childenCategories = $ucm->getCategoryRepository()->findBy([
                'is_enabled' => true,
                'parent'     => $lastCategory,
                'structure'  => $ucm->getDefaultStructure(),
            ]);
        } else {
            $childenCategories = $ucm->getCategoryRepository()->findBy([
                'is_enabled' => true,
                'parent'     => null,
                'structure'  => $ucm->getDefaultStructure(),
            ]);
        }

        $item = $ucm->findItem($itemSlug);

        if (empty($item)) {
            throw $this->createNotFoundException();
        }

        $this->get('html')->setMetas($item->getMeta());

        $this->get('cms.breadcrumbs')->add($this->generateUrl('unicat.item', [
                'slug' => empty($lastCategory) ? '' : $lastCategory->getSlugFull(),
                'itemSlug' => $item->getSlug(),
            ]).'/', $item->getAttribute('title'));

        $this->node->addFrontControl('edit')
            ->setTitle('Редактировать')
            ->setUri($this->generateUrl('unicat_admin.item_edit', ['configuration' => $ucm->getConfiguration()->getName(), 'id' => $item->getId()]));

        return $this->render('UnicatModule::item.html.twig', [
            'mode'          => 'view',
            'attributes'    => $ucm->getAttributes(),
            'item'          => $item,
//            'lastCategory'      => $lastCategory,
//            'childenCategories' => $childenCategories,
        ]);
    }
}
