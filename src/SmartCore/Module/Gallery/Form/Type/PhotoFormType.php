<?php

namespace SmartCore\Module\Gallery\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class PhotoFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('description', null, ['attr' => ['autofocus' => 'autofocus']])
            ->add('file', 'file')
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'SmartCore\Module\Gallery\Entity\Photo',
        ]);
    }

    public function getName()
    {
        return 'smart_module_gallery_photo';
    }
}
