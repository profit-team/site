<?php

namespace SmartCore\Module\Blog\Form\Type;

use Symfony\Component\Form\FormBuilderInterface;

class CategoryEditFormType extends CategoryFormType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        parent::buildForm($builder, $options);

        $builder->add('save', 'submit', [
            'attr' => [
                'class' => 'btn btn-primary',
            ],
        ]);
    }

    public function getName()
    {
        return 'smart_blog_category_edit';
    }
}
