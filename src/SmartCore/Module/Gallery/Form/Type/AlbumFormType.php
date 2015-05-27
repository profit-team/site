<?php

namespace SmartCore\Module\Gallery\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class AlbumFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('is_enabled', null, ['required' => false])
            ->add('title')
            ->add('position')
            ->add('description')
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'SmartCore\Module\Gallery\Entity\Album',
        ]);
    }

    public function getName()
    {
        return 'smart_module_gallery_album';
    }
}
