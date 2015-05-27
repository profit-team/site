<?php

namespace SmartCore\Module\Unicat\Entity;

use Doctrine\ORM\Mapping as ORM;
use Smart\CoreBundle\Doctrine\ColumnTrait;

/**
 * @ORM\Entity()
 * @ORM\Table(name="unicat__structures")
 */
class UnicatStructure
{
    use ColumnTrait\Id;
    use ColumnTrait\CreatedAt;
    use ColumnTrait\Name;
    use ColumnTrait\Position;
    use ColumnTrait\TitleNotBlank;
    use ColumnTrait\UserId;

    /**
     * @var string
     *
     * @ORM\Column(type="string")
     */
    protected $title_form;

    /**
     * Вхождение записей в структуру: single или multi.
     *
     * @todo можно переделать на флажок (is_multiple_entries), если больше не предвидется вариантов.
     *
     * @var string
     *
     * @ORM\Column(type="string", length=16)
     */
    protected $entries;

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", nullable=true)
     */
    protected $is_required;

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", options={"default":0})
     */
    protected $is_default_inheritance;

    /**
     * Древовидная структура.
     *
     * @ORM\Column(type="boolean", options={"default":1})
     */
    protected $is_tree;

    /**
     * @var string
     *
     * @ORM\Column(type="text", nullable=true)
     */
    protected $properties;

    /**
     * @var UnicatConfiguration
     *
     * @ORM\ManyToOne(targetEntity="UnicatConfiguration", inversedBy="structures")
     */
    protected $configuration;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->created_at = new \DateTime();
        $this->position   = 0;
        $this->properties = null;
        $this->user_id    = 0;
        $this->is_default_inheritance = false;
        $this->is_required = true;
        $this->is_tree     = true;
    }

    /**
     * @return string
     */
    public function getEntries()
    {
        return $this->entries;
    }

    /**
     * @param string $entries
     *
     * @return $this
     */
    public function setEntries($entries)
    {
        $this->entries = $entries;

        return $this;
    }

    /**
     * @param bool $is_default_inheritance
     *
     * @return $this
     */
    public function setIsDefaultInheritance($is_default_inheritance)
    {
        if (empty($is_default_inheritance)) {
            $is_default_inheritance = 0;
        }

        $this->is_default_inheritance = $is_default_inheritance;

        return $this;
    }

    /**
     * @return bool
     */
    public function getIsDefaultInheritance()
    {
        return $this->is_default_inheritance;
    }

    /**
     * @param bool $is_required
     *
     * @return $this
     */
    public function setIsRequired($is_required)
    {
        if (empty($is_required)) {
            $is_required = 0;
        }

        $this->is_required = $is_required;

        return $this;
    }

    /**
     * @return bool
     */
    public function getIsRequired()
    {
        return $this->is_required;
    }

    /**
     * @return bool
     */
    public function isRequired()
    {
        return $this->is_required;
    }

    /**
     * @return bool
     */
    public function getIsTree()
    {
        return $this->is_tree;
    }

    /**
     * @return bool
     */
    public function isTree()
    {
        return $this->is_tree;
    }

    /**
     * @param bool $is_tree
     *
     * @return $this
     */
    public function setIsTree($is_tree)
    {
        if (empty($is_tree)) {
            $is_tree = 0;
        }

        $this->is_tree = $is_tree;

        return $this;
    }

    /**
     * @param string $properties
     *
     * @return $this
     */
    public function setProperties($properties)
    {
        $this->properties = $properties;

        return $this;
    }

    /**
     * @return string
     */
    public function getProperties()
    {
        return $this->properties;
    }

    /**
     * @param UnicatConfiguration $configuration
     *
     * @return $this
     */
    public function setConfiguration(UnicatConfiguration $configuration)
    {
        $this->configuration = $configuration;

        return $this;
    }

    /**
     * @return UnicatConfiguration
     */
    public function getConfiguration()
    {
        return $this->configuration;
    }

    /**
     * @param string $title_form
     *
     * @return $this
     */
    public function setTitleForm($title_form)
    {
        $this->title_form = $title_form;

        return $this;
    }

    /**
     * @return string
     */
    public function getTitleForm()
    {
        return $this->title_form;
    }

    /**
     * @return bool
     */
    public function isMultipleEntries()
    {
        return $this->entries === 'multi' ? true : false;
    }

    /**
     * @return array
     */
    public static function getEntriesChoices()
    {
        return [
            'single' => 'single',
            'multi'  => 'multi',
        ];
    }
}
