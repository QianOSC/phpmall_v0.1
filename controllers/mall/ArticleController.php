<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace app\controllers\mall;

use app\forms\mall\article\ArticleForm;

class ArticleController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionIndex()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new ArticleForm();
            $form->attributes = \Yii::$app->request->get();
            return $this->asJson($form->getList());
        } else {
            return $this->render('index');
        }
    }

    public function actionDestroy()
    {
        if ($id = \Yii::$app->request->post('id')) {
            $form = new ArticleForm();
            $form->id = $id;
            return $this->asJson($form->destroy());
        }
    }

    public function actionSwitchStatus()
    {
        if (\Yii::$app->request->isPost) {
            $form = new ArticleForm();
            $form->attributes = \Yii::$app->request->post();
            return $this->asJson($form->switchStatus());
        }
    }

    public function actionEdit()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new ArticleForm();
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
