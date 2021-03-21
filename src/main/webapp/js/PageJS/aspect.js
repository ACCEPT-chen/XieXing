/**
 * @file aspect
 * @fork https://github.com/ecomfe/saber-lang/blob/master/src/function/aspect.js
 */
(function () {

    /**
     * Aspect
     *
     * @inner
     * @type {Object}
     */
    var Aspect = {};

    /**
     * before AOP
     *
     * @private
     * @param {string} method 娆睞OP鐨勭洰鏍囨柟娉曞悕
     * @param {Function} fn AOP澶勭悊鍑芥暟
     * @param {*} context `fn`璋冪敤鏃剁殑涓婁笅鏂�
     * @return {Object} 鐩爣瀵硅薄
     */
    Aspect.before = function (method, fn, context) {
        return aspectTo(this, 'before', method, fn, context);
    };

    /**
     * after AOP
     *
     * @private
     * @param {string} method 娆睞OP鐨勭洰鏍囨柟娉曞悕
     * @param {Function} fn AOP澶勭悊鍑芥暟
     * @param {*} context `fn`璋冪敤鏃剁殑涓婁笅鏂�
     * @return {Object} 鐩爣瀵硅薄
     */
    Aspect.after = function (method, fn, context) {
        return aspectTo(this, 'after', method, fn, context);
    };


    /**
     * 瀵筦鐩爣瀵硅薄`鐨刞鎸囧畾鏂规硶`杩涜`AOP`鍖呰
     *
     * @inner
     * @param {Object} target 鐩爣瀵硅薄
     * @param {string} type AOP鏂瑰紡,鍙彇鍊� `before` | `after`
     * @param {string} method 娆睞OP鐨勭洰鏍囧璞＄殑鏂规硶鍚�
     * @param {Function} fn AOP澶勭悊鍑芥暟
     * @param {*} context `fn`璋冪敤鏃剁殑涓婁笅鏂�
     * @return {Object} 鐩爣瀵硅薄
     */
    function aspectTo(target, type, method, fn, context) {
        var oriMethod = target[method];

        if (oriMethod) {
            if (type === 'before') {
                target[method] = function () {
                    // abort support
                    if (fn.apply(context || fn, arguments) !== false) {
                        oriMethod.apply(this, arguments);
                    }
                };
            }
            else if (type === 'after') {
                target[method] = function () {
                    oriMethod.apply(this, arguments);
                    fn.apply(context || fn, arguments);
                };
            }
        }

        return target;
    }


    /**
     * Aspect
     *
     * @exports Aspect
     * @type {Object}
     */
    var exports = {};

    /**
     * 灏� `Aspect` 娣峰叆鍒扮洰鏍囧璞�
     *
     * @public
     * @param {Object} obj 鐩爣瀵硅薄
     * @return {Object} 娣峰叆 `Aspect` 鍚庣殑鐩爣瀵硅薄
     */
    exports.mixin = function (obj) {
        // 鐪佺暐浜� hasOwnProperty 鏍￠獙
        /* eslint-disable guard-for-in */
        for (var method in Aspect) {
            obj[method] = Aspect[method];
        }
        /* eslint-enable guard-for-in */
        return obj;
    };

    window.AOP =  exports;

})();