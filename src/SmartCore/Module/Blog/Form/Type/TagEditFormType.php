<?php

namespace SmartCore\Module\Blog\Form\Type;

use Symfony\Component\Form\FormBuilderInterface;

class TagEditFormType extends TagFormType
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
        return 'smart_blog_tag_edit';
    }
}
