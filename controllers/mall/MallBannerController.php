<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace app\controllers\mall;

use app\forms\mall\banner\MallBannerForm;

class MallBannerController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionIndex()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new MallBannerForm();
            $form->attributes = \Yii::$app->request->get();
            return $this->asJson($form->getList());
        } else {
            return $this->render('index');
        }
    }

    public function actionEdit()
    {
        if (\Yii::$app->request->isPost) {
            $form = new MallBannerForm();
            $form->attributes = \Yii::$app->request->post();
            return $form->save();
        }
    }
}
