<?php

namespace SmartCore\Bundle\MediaBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Smart\CoreBundle\Doctrine\ColumnTrait;
use SmartCore\Bundle\MediaBundle\Provider\ProviderInterface;

/**
 * @ORM\Entity
 * @ORM\Table(name="media_storages")
 */
class Storage
{
    use ColumnTrait\Id;
    use ColumnTrait\CreatedAt;
    use ColumnTrait\Title;

    /**
     * @var string instanceof ProviderInterface
     *
     * @ORM\Column(type="string", length=255)
     */
    protected $provider;

    /**
     * @var string
     *
     * @ORM\Column(type="string", length=255)
     */
    protected $relative_path;

    /**
     * @var array
     *
     * @ORM\Column(type="array")
     */
    protected $params;

    /**
     * @var File[]|ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="File", mappedBy="storage", fetch="EXTRA_LAZY")
     */
    protected $files;

    /**
     * @param string $relativePath
     */
    public function __construct($relativePath = '')
    {
        $this->created_at       = new \DateTime();
        $this->files            = new ArrayCollection();
        $this->relative_path    = $relativePath;
        $this->title            = 'Новое хранилище';
        $this->provider         = 'SmartCore\Bundle\MediaBundle\Provider\LocalProvider';
    }

    /**
     * @return string
     */
    public function __toString()
    {
        return $this->title;
    }

    /**
     * @param string $relative_path
     *
     * @return $this
     */
    public function setRelativePath($relative_path)
    {
        $this->relative_path = $relative_path;

        return $this;
    }

    /**
     * @return string
     */
    public function getRelativePath()
    {
        return $this->relative_path;
    }

    /**
     * @param array|null $params
     *
     * @return $this
     */
    public function setParams(array $params = null)
    {
        $this->params = $params;

        return $this;
    }

    /**
     * @return array
     */
    public function getParams()
    {
        return $this->params;
    }

    /**
     * @param string $provider
     *
     * @return $this
     */
    public function setProvider($provider)
    {
        $this->provider = $provider;

        return $this;
    }

    /**
     * @return ProviderInterface
     */
    public function getProvider()
    {
        return $this->provider;
    }

    /**
     * @return File[]
     */
    public function getFiles()
    {
        return $this->files;
    }
}
