<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2018 浙江禾匠信息科技有限公司
 * author: wxf
 */

namespace app\controllers\mall;

use app\forms\mall\cat\CatEditForm;
use app\forms\mall\cat\CatForm;
use app\forms\mall\cat\CatStyleForm;
use app\forms\mall\goods\ImportCatForm;
use app\forms\mall\goods\ImportDataLogForm;

class CatController extends MallController
{
    public function init()
    {
        return parent::init();
    }

    public function actionIndex()
    {
        if (\Yii::$app->request->isAjax) {
            if (\Yii::$app->request->isPost) {
            } else {
                $form = new CatForm();
                $form->attributes = \Yii::$app->request->get();
                $list = $form->getList();

                return $this->asJson($list);
            }
        } else {
            if (\Yii::$app->request->post('flag') === 'EXPORT') {
                $form = new CatForm();
                $chooseList = \Yii::$app->request->post('choose_list');
                $form->choose_list = $chooseList ? explode(',', $chooseList) : [];
                $form->exportCat();
                return false;
            } else {
                return $this->render('index');
            }
        }
    }

    /**
     * 添加、编辑
     * @return string|\yii\web\Response
     */
    public function actionEdit()
    {
        if (\Yii::$app->request->isAjax) {
            if (\Yii::$app->request->isPost) {
                $form = new CatEditForm();
                $form->attributes = \Yii::$app->request->post('form');
                $res = $form->save();

                return $this->asJson($res);
            } else {
                $form = new CatForm();
                $form->attributes = \Yii::$app->request->get();
                $detail = $form->getDetail();

                return $this->asJson($detail);
            }
        } else {
            return $this->render('edit');
        }
    }


    public function actionAllList()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->get();
        $res = $form->getAllList();

        return $res;
    }

    /**
     * 删除
     * @return \yii\web\Response
     */
    public function actionDestroy()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->post();
        $res = $form->destroy();

        return $this->asJson($res);
    }

    /**
     * 查找子分类
     * @return \yii\web\Response
     */
    public function actionChildrenList()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->get();
        $res = $form->getChildrenList();

        return $this->asJson($res);
    }

    /**
     * 获取商品分类列表
     * @return \yii\web\Response
     */
    public function actionOptions()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->get();
        $res = $form->getOptionList();

        return $this->asJson($res);
    }

    public function actionStyle()
    {
        if (\Yii::$app->request->isAjax) {
            if (\Yii::$app->request->isPost) {
                $form = new CatStyleForm();
                $form->attributes = \Yii::$app->request->post();
                return $form->save();
            } else {
                $form = new CatStyleForm();
                $form->attributes = \Yii::$app->request->get();
                return $this->asJson($form->search());
            }
        } else {
            return $this->render('style');
        }
    }

    public function actionSwitchStatus()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->get();
        $res = $form->switchStatus();

        return $this->asJson($res);
    }

    public function actionSort()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->get();
        return $this->asJson($form->sortSave());
    }

    public function actionTransferCat()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->get();
        return $this->asJson($form->transferCat());
    }

    public function actionStoreSort()
    {
        $form = new CatForm();
        $form->attributes = \Yii::$app->request->post();
        return $this->asJson($form->storeSort());
    }

    public function actionImportCatLog()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new ImportDataLogForm();
            $form->attributes = \Yii::$app->request->get();
            $form->type = 2;
            $res = $form->getList();

            return $this->asJson($res);
        } else {
            if (\Yii::$app->request->post('flag') === 'EXPORT') {
                $form = new ImportDataLogForm();
                $form->importCat();
                return false;
            } else {
                return $this->render('import-cat-log');
            }

        }
    }

    public function actionImportCat()
    {
        if (\Yii::$app->request->isAjax) {
            $form = new ImportCatForm();
            $form->attributes = \Yii::$app->request->post();
            $res = $form->save();

            return $this->asJson($res);
        }
    }
}
