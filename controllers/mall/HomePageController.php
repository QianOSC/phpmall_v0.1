<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: wxf
 */


namespace app\controllers\mall;


use app\forms\mall\home_page\HomePageEditForm;
use app\forms\mall\home_page\HomePageForm;

class HomePageController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionSetting()
    {
        if (\Yii::$app->request->isAjax) {
            if (\Yii::$app->request->isGet) {
                $form = new HomePageForm();
                $res = $form->getDetail();

                return $this->asJson($res);
            } else {
                $form = new HomePageEditForm();
                $form->data = \Yii::$app->request->post('list');
                return $form->save();
            }
        } else {
            return $this->render('setting');
        }
    }

    public function actionOption()
    {
        $form = new HomePageForm();
        $res = $form->getOption();

        return $this->asJson($res);
    }
}
