<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: wxf
 */


namespace app\controllers\mall;


use app\forms\mall\copyright\CopyrightEditForm;
use app\forms\mall\copyright\CopyrightForm;

class CopyrightController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionSetting()
    {
        if (\Yii::$app->request->isAjax) {
            if (\Yii::$app->request->isGet) {
                $form = new CopyrightForm();
                $res = $form->getDetail();

                return $this->asJson($res);
            } else {
                $form = new CopyrightEditForm();
                $form->data = \Yii::$app->request->post('form');
                $form->attributes = \Yii::$app->request->post();
                return $form->save();
            }
        } else {
            return $this->render('setting');
        }
    }
}
