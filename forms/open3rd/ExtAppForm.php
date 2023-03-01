<?php
/**
 * @copyright ©2020 浙江禾匠信息科技
 * @link: http://www.zjhejiang.com
 * Created by PhpStorm.
 * User: Andy - Wangjie
 * Date: 2020/9/25
 * Time: 17:35
 */

namespace app\forms\open3rd;

use app\models\WxappPlatform;
use app\plugins\wxapp\models\WxappWxminiprograms;

/**
 * Class ExtAppForm
 * @package app\forms\open3rd
 */
class ExtAppForm
{
    /**
     * @param WxappWxminiprograms|null $extApp
     * @param int $is_platform
     * @return ExtApp
     * @throws Open3rdException
     * @throws \luweiss\Wechat\WechatException
     */
    public static function instance(WxappWxminiprograms $extApp = null, $is_platform = 0)
    {
        $open3rd = WxappPlatform::getPlatform();
        if ($is_platform) {
            return new ExtApp([
                'thirdAppId' => $open3rd->appid,
                'thirdToken' => $open3rd->token,
                'thirdAccessToken' => $open3rd->component_access_token,
                'is_platform' => 1,
            ]);
        }
        if ($extApp === null) {
            $extApp = WxappWxminiprograms::findOne(['mall_id' => \Yii::$app->mall->id, 'is_delete' => 0]);
        }
        if (!$extApp) {
            throw new \Exception('尚未授权');
        }
        return new ExtApp([
            'thirdAppId' => $open3rd->appid,
            'thirdToken' => $open3rd->token,
            'thirdAccessToken' => $open3rd->component_access_token,
            'authorizer_appid' => $extApp->authorizer_appid,
        ]);
    }
}
