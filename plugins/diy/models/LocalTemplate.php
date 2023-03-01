<?php

namespace app\plugins\diy\models;

use Yii;

/**
 * @property int $id 模板id
 * @property string $name 模板名称
 * @property string $pics 模板图片
 * @property string $type 模板类型
 * @property string $version 模板版本
* @property string $detail 模板描述
 */
class LocalTemplate extends \app\models\ModelActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%local_template}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => '模板ID',
            'name' => '模板名称',
            'pics' => '模板图片',
            'type' => 'home:首页布局 diy:DIY模板',
            'version' => '模板版本',
            'detail' => '云模板详情',
        ];
    }
}
