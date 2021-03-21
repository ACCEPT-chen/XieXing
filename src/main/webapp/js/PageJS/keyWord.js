/**
 * 瀹氫箟涓€涓垪琛ㄦ暟鎹粨鏋�
 * 浣滅敤锛氭坊鍔犲厓绱犮€佸垹闄ゅ厓绱犮€佹竻闄ゆ墍鏈夊厓绱狅紝灏嗘暟鎹腑鐨勫厓绱犵粍瑁呮垚瀵硅薄杩斿洖涓€涓暟鎹�
 * @constructor
 */
function List() {
    this.dataStore = new Array();
    this.listSize = 0;
    this.pos = 0;
}
List.prototype = {
    constructor: List,
    append: function(name) {
        this.dataStore[this.listSize++] = name;
    },
    front: function() {
        this.pos = 0;
    },
    end: function() {
        this.pos = this.listSize - 1;
    },
    length: function() {
        return this.listSize;
    },
    find:function(name){
        var index = -1;
        this.dataStore.forEach(function(data, i, array){
            if(data == name) {
                index = i;
            }
        });
        return index;
    },
    remove: function(name) {

        var index = this.find(name);
        if(index > -1) {
            this.dataStore.splice(index,1);
            --this.listSize;
            return true;
        }

        return false;


    },
    getElement: function() {
        return this.dataStore[this.pos];
    },
    clear: function() {
        delete this.dataStore;
        this.dataStore = [];
        this.pos = this.listSize = 0;
    },
    getAllElement: function() {
        return this.dataStore.map(function(name, i, array) {
            return {
                id: i,
                name: name,
                html: '<div class="tag-checked-name">' + name.substr(0, 10) + '<em data-word-tag-close="' + name + '"></em></div>'
            }
        })
    }
}

/**
 * 瀹氫箟涓€涓敤鏉ュ鍒楄〃鎿嶄綔鐨勫璞�
 * @param options
 */
var doKeyWord = function(options) {

    var settings = options;

    var list = new List();

    return AOP.mixin({
        init: function(arr) {
            var that = this;
            // 鍒濆鍖�
            if (typeof arr == "string") {
                arr = arr == '' ? [] : arr.split(',');
            }
            if (typeof arr == 'undefined') {
                arr = [];
            }
            // 娓呯┖鏁版嵁
            list.clear();
            // 渚垮埄娣诲姞鏁版嵁涓�
            arr.forEach(function(data, i, array){
                that.add(data);
            })
        },
        render: function() {
            // 娓叉煋鏁堟灉

            var valueArr = [];
            var array = list.getAllElement();
            var html = array.map(function(data, index) {
                valueArr.push(data.name);
                return data.html;
            });

            $(settings.panel).html(html.join(''));
            $(settings.value).val(valueArr.join(','));

        },
        add: function(name) {
            // 娣诲姞鏁版嵁
            if(list.find(name) > -1) {
                return false;
            }
            list.append(name);
        },
        clear: function() {
            list.clear();
        },
        front: function() {
            return list.front();
        },
        end: function() {
            return list.end()
        },
        getElement: function(){
            return list.getElement();
        },
        remove: function(index) {
            list.remove(index);
        },
        length: function() {
            return list.length();
        }
    });
}

$(function() {

    $.fn.keyWord = function(options) {

        var keyWord = doKeyWord(options);

        // 瀵规坊鍔犵殑鏁版嵁杩涜妫€鏌�
        function doCheck() {
            console.log(options.max + "  " + keyWord.length());
            if (options.max < keyWord.length() + 1) {
                alert(options.tips);
                return false;
            }

            return true;
        }


        var render = keyWord.render;

        // 娣诲姞鍓嶆鏌�
        keyWord.before('add', doCheck);
        // 鍒濆鍖栧悗娓叉煋鏁堟灉
        keyWord.after('init', render);
        // 娣诲姞鍚庢覆鏌撴晥鏋�
        keyWord.after('add', render);
        // 鍒犻櫎鍚庢覆鏌撴晥鏋�
        keyWord.after('remove', render);

        var that = $(this);
        // 鍒犻櫎鍏冪礌
        $(document).on('click', '[data-word-tag-close]', function() {
            var id = $(this).data('word-tag-close');
            // 杩囨护鎺変笉鍒犻櫎鐨�
            keyWord.remove(id);
        });
        /**
         * Backspace鍒犻櫎 瀵瑰簲鐨勯敭鐩樼紪鐮�
         * e.keyCode == 8 锛欱ackspace閿�
         */
        that.keydown(function(e) {
            var that = $(this);
            var val = $.trim(that.val());
            if (val == "" && e.keyCode == 8) {
                keyWord.end();
                keyWord.remove(keyWord.getElement());
            }
        });

        // 娣诲姞鏁版嵁
        function doAdd(name) {
            name = $.trim(that.val());
            that.val('');
            if (name == '') {
                return;
            }
            keyWord.add(name);
        }

        /**
         * 鍒ゆ柇鏈夎緭鍏ョ┖鏍煎悧
         * e.keyCode == 32 绌烘牸閿�
         */
        that.keyup(function(e) {
            var that = $(this);
            var isSpaceKey = /\s+$/gi.test(that.val());
            // 鏄┖鏍奸敭杈撳叆浜嗕竴涓┖鏍煎瓧绗�
            if (e.keyCode == 32 && isSpaceKey) {
                doAdd(that.val())
            }
        });
        // 榧犳爣澶卞幓鐒︾偣
        that.blur(function(e) {
            doAdd(that.val())
        });

        this.init = function(arr) {
            keyWord.init(arr);
        }
        return this;

    }
});