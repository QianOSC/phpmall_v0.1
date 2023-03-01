<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace app\controllers\mall;

use app\forms\mall\banner\BannerForm;

class BannerController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionIndex()
    {
        $form = new BannerForm();
        $form->attributes = \Yii::$app->request->get();
        return $this->asJson($form->getList());
    }

    public function actionDestroy()
    {
        if ($ids = \Yii::$app->request->post('ids')) {
            $form = new BannerForm();
            $form->ids = $ids;
            return $this->asJson($form->destroy());
        }
    }

    public function actionEdit()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new BannerForm();
            if (\Yii::$app->request->isPost) {
                $form->attributes = \Yii::$app->request->post();
                return $form->save();
            } else {
                $form->attributes = \Yii::$app->request->get();
                return $this->asJson($form->getDetail());
            }
        } else {
            return $this->render('edit');
        }
    }
}
