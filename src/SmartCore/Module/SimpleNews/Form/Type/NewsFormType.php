<?php

namespace SmartCore\Module\SimpleNews\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class NewsFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        /** @var \SmartCore\Module\SimpleNews\Entity\News $news */
        $news = $options['data'];
        $newsInstance = $news->getInstance();

        $builder
            ->add('is_enabled', null, ['required' => false])
            ->add('title',      null, ['attr' => ['autofocus' => 'autofocus']])
            ->add('slug')
        ;

        if ($newsInstance->isUseImage()) {
            $builder->add('image', new ImageFormType(), [
                'label' => 'Image',
                'required' => false,
                'data' => $news->getImageId(),
            ]);
        }

        $builder->add('annotation', null, ['attr' => ['class' => 'wysiwyg', 'data-theme' => 'advanced']]);

        if ($newsInstance->isUseAnnotationWidget()) {
            $builder->add('annotation_widget', null, ['attr' => ['class' => 'wysiwyg', 'data-theme' => 'advanced']]);
        }

        $builder
            ->add('text',       null, ['attr' => ['class' => 'wysiwyg', 'data-theme' => 'advanced']])
            ->add('publish_date')
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'SmartCore\Module\SimpleNews\Entity\News',
        ]);
    }

    public function getName()
    {
        return 'smart_module_news_item';
    }
}
