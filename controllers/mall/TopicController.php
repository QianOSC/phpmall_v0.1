<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace app\controllers\mall;

use app\forms\mall\topic\TopicForm;

class TopicController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionIndex()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new TopicForm();
            $form->attributes = \Yii::$app->request->get();
            return $this->asJson($form->getList());
        } else {
            return $this->render('index');
        }
    }

    public function actionDestroy()
    {
        if ($id = \Yii::$app->request->post('id')) {
            $form = new TopicForm();
            $form->id = $id;
            return $this->asJson($form->destroy());
        } else {
            return $this->asJson([
                'code' => 1,
                'msg' => 'no post'
            ]);
        }
    }

    public function actionEdit()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new TopicForm();
            if (\Yii::$app->request->isPost) {
                $form->attributes = json_decode(\Yii::$app->request->post('data'), true);
                return $form->save();
            } else {
                $form->attributes = \Yii::$app->request->get();
                return $this->asJson($form->getDetail());
            }
        } else {
            return $this->render('edit');
        }
    }

    public function actionEditSort()
    {
        if (\Yii::$app->request->isPost) {
            $form = new TopicForm();
            $form->attributes = \Yii::$app->request->post();
            return $this->asJson($form->editSort());
        }
    }

    public function actionEditChosen()
    {
        if ($id = \Yii::$app->request->post('id')) {
            $form = new TopicForm();
            $form->attributes = \Yii::$app->request->post();
            return $this->asJson($form->editChosen());
        } else {
            return $this->asJson([
                'code' => 1,
                'msg' => 'no post'
            ]);
        }
    }
}
