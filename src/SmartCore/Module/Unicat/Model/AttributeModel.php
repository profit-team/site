<?php

namespace SmartCore\Module\Unicat\Model;

use Doctrine\ORM\Mapping as ORM;
use Smart\CoreBundle\Doctrine\ColumnTrait;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Yaml\Yaml;

/**
 * ORM\Entity()
 * ORM\Table(name="unicat_attributes")
 *
 * @UniqueEntity(fields={"name"}, message="Имя свойства должно быть уникальным.")
 */
class AttributeModel
{
    use ColumnTrait\Id;
    use ColumnTrait\IsEnabled;
    use ColumnTrait\CreatedAt;
    use ColumnTrait\Position;
    use ColumnTrait\TitleNotBlank;
    use ColumnTrait\UserId;

    /**
     * enum('string','text','date','datetime','img','file','select','multiselect','int','double','checkbox','password')
     *
     * @ORM\Column(type="string", length=12)
     */
    protected $type;

    /**
     * @var string
     *
     * @ORM\Column(type="string", nullable=true, options={"default":"<p>"})
     */
    protected $open_tag;

    /**
     * @var string
     *
     * @ORM\Column(type="string", nullable=true, options={"default":"</p>"})
     */
    protected $close_tag;

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", options={"default":0})
     */
    protected $is_dedicated_table;

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", options={"default":0})
     */
    protected $is_link;

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", options={"default":0})
     */
    protected $is_required;

    /**
     * @var bool
     *
     * @ORM\Column(type="boolean", options={"default":1})
     */
    protected $is_show_title;

    /**
     * Отображать в списке администратора.
     *
     * @var bool
     *
     * @ORM\Column(type="boolean")
     */
    protected $show_in_admin;

    /**
     * Отображать в списке записей.
     *
     * @var bool
     *
     * @ORM\Column(type="boolean")
     */
    protected $show_in_list;

    /**
     * Отображать при просмотре записи.
     *
     * @var bool
     *
     * @ORM\Column(type="boolean")
     */
    protected $show_in_view;

    /**
     * @var array
     *
     * @ORM\Column(type="array")
     */
    protected $params;

    /**
     * @var array
     *
     * @ORM\Column(type="text", nullable=true)
     */
    protected $params_yaml;

    /**
     * @var AttributesGroupModel
     *
     * @ORM\ManyToOne(targetEntity="AttributesGroup", inversedBy="attributes")
     */
    protected $group;

    /**
     * @var string
     * @ORM\Column(type="string", unique=true)
     * @Assert\NotBlank()
     * @Assert\Regex(
     *      pattern="/^[a-z_]+$/",
     *      htmlPattern="^[a-z_]+$",
     *      message="Имя может состоять только из латинских букв в нижнем регистре и символов подчеркивания."
     * )
     *
     * @todo перевод сообщения
     */
    protected $name;

    /**
     * @var string
     */
    protected $update_all_records_with_default_value;

    /**
     * Constructor.
     */
    public function __construct()
    {
        $this->created_at       = new \DateTime();
        $this->is_dedicated_table = false;
        $this->is_enabled       = true;
        $this->is_link          = false;
        $this->is_required      = false;
        $this->is_show_title    = true;
        $this->params           = [];
        $this->params_yaml      = null;
        $this->position         = 0;
        $this->user_id          = 0;
        $this->open_tag         = '<p>';
        $this->close_tag        = '</p>';
    }

    /**
     * @see getName
     *
     * @return string
     */
    public function __toString()
    {
        return (string) $this->getName();
    }

    /**
     * @return null|string
     */
    public function getValueClassName()
    {
        if ($this->is_dedicated_table) {
            $className = 'Value';

            foreach (explode('_', $this->name) as $namePart) {
                $className .= ucfirst($namePart);
            }

            return $className;
        }

        return;
    }

    /**
     * @return string
     */
    public function getValueClassNameWithNameSpace()
    {
        $reflector = new \ReflectionClass($this);

        return $reflector->getNamespaceName().'\\'.$this->getValueClassName();
    }

    /**
     * @param bool $is_dedicated_table
     *
     * @return $this
     */
    public function setIsDedicatedTable($is_dedicated_table)
    {
        $this->is_dedicated_table = $is_dedicated_table;

        return $this;
    }

    /**
     * @return bool
     */
    public function getIsDedicatedTable()
    {
        return $this->is_dedicated_table;
    }

    /**
     * @return bool
     */
    public function isIsLink()
    {
        return $this->is_link;
    }

    /**
     * @param bool $is_link
     *
     * @return $this
     */
    public function setIsLink($is_link)
    {
        $this->is_link = $is_link;

        return $this;
    }

    /**
     * @param bool $is_required
     *
     * @return $this
     */
    public function setIsRequired($is_required)
    {
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
    public function isIsShowTitle()
    {
        return $this->is_show_title;
    }

    /**
     * @param bool $is_show_title
     *
     * @return $this
     */
    public function setIsShowTitle($is_show_title)
    {
        $this->is_show_title = $is_show_title;

        return $this;
    }

    /**
     * @param AttributesGroupModel $group
     *
     * @return $this
     */
    public function setGroup(AttributesGroupModel $group)
    {
        $this->group = $group;

        return $this;
    }

    /**
     * @return AttributesGroupModel
     */
    public function getGroup()
    {
        return $this->group;
    }

    /**
     * @param array $params
     *
     * @return $this
     */
    public function setParams(array $params = [])
    {
        $this->params = $params;

        return $this;
    }

    /**
     * @return array
     */
    public function getParams()
    {
        return (null == $this->params) ? [] : $this->params;
    }

    /**
     * @return array
     */
    public function getParam($name)
    {
        if (!empty($this->params) and isset($this->params[$name])) {
            return $this->params[$name];
        } else {
            return [];
        }
    }

    /**
     * @param array $params_yaml
     *
     * @return $this
     */
    public function setParamsYaml($params_yaml)
    {
        $this->params_yaml = $params_yaml;

        $params = Yaml::parse($params_yaml);

        if (empty($params)) {
            $params = [];
        }

        $this->setParams($params);

        return $this;
    }

    /**
     * @return array
     */
    public function getParamsYaml()
    {
        return $this->params_yaml;
    }

    /**
     * @param bool $show_in_admin
     *
     * @return $this
     */
    public function setShowInAdmin($show_in_admin)
    {
        $this->show_in_admin = $show_in_admin;

        return $this;
    }

    /**
     * @return bool
     */
    public function getShowInAdmin()
    {
        return $this->show_in_admin;
    }

    /**
     * @param bool $show_in_list
     *
     * @return $this
     */
    public function setShowInList($show_in_list)
    {
        $this->show_in_list = $show_in_list;

        return $this;
    }

    /**
     * @return bool
     */
    public function getShowInList()
    {
        return $this->show_in_list;
    }

    /**
     * @param bool $show_in_view
     *
     * @return $this
     */
    public function setShowInView($show_in_view)
    {
        $this->show_in_view = $show_in_view;

        return $this;
    }

    /**
     * @return bool
     */
    public function getShowInView()
    {
        return $this->show_in_view;
    }

    /**
     * @param string $type
     *
     * @return $this
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param string $type
     *
     * @return bool
     */
    public function isType($type)
    {
        return ($type === $this->type) ? true : false;
    }

    /**
     * @param string $mode
     *
     * @return bool
     */
    public function isShowIn($mode)
    {
        switch ($mode) {
            case 'view':
                return $this->show_in_view;
                break;
            case 'list':
                return $this->show_in_list;
                break;
            case 'admin':
                return $this->show_in_admin;
                break;
        }

        return false;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     *
     * @return static
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return string
     */
    public function getOpenTag()
    {
        return $this->open_tag;
    }

    /**
     * @param string $open_tag
     *
     * @return $this
     */
    public function setOpenTag($open_tag)
    {
        $this->open_tag = $open_tag;

        return $this;
    }

    /**
     * @return string
     */
    public function getCloseTag()
    {
        return $this->close_tag;
    }

    /**
     * @param string $close_tag
     *
     * @return $this
     */
    public function setCloseTag($close_tag)
    {
        $this->close_tag = $close_tag;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getUpdateAllRecordsWithDefaultValue()
    {
        return $this->update_all_records_with_default_value;
    }

    /**
     * @param mixed $update_all_records_with_default_value
     *
     * @return $this
     */
    public function setUpdateAllRecordsWithDefaultValue($update_all_records_with_default_value)
    {
        $this->update_all_records_with_default_value = $update_all_records_with_default_value;

        return $this;
    }
}
