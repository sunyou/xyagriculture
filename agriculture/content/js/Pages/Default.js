
/** Open the quick tips */
Ext.QuickTips.init();
Ext.form.Field.prototype.msgTarget = 'side';

/** redefine the blank image url */
var imagePath = 'ext/resources/images';

Ext.BLANK_IMAGE_URL = imagePath + '/default/s.gif';

var tools = [{
    id: 'gear',
    handler: function () {
        Ext.Msg.alert('Message', 'This function need to be modified.');
    }
}, {
    id: 'close',
    handler: function (e, target, panel) {
        panel.ownerCt.remove(panel, true);
    }
}];

/** 这里是页面展示的开始 */
Ext.onReady(function () {

    var BorderLayout = new Ext.Panel({
        layout: 'border',
        renderTo: Ext.getBody(),
        items: [
            new Ext.Panel({ title: '上北', region: 'north', html: '可以放个logo什么的' }),
            new Ext.Panel({ title: '下南', region: 'south', html: '版权信息？', autoEl: 'center' }),
            new Ext.Panel({ title: '中间', region: 'center', html: '主面板' }),
            new Ext.Panel({ title: '左东', region: 'west', html: '树型菜单或是手风琴' }),
            new Ext.Panel({ title: '右西', region: 'east', html: '常用功能或是去掉？' })
        ]
    });

});