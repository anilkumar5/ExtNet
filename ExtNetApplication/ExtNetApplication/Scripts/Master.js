//Filter data in left tree menu
var filterTree = function (tf, e) {

    var tree = App.TreePanel1,
                text = tf.getRawValue();

    tree.clearFilter();

    if (Ext.isEmpty(text, false)) {
        return;
    }

    if (e.getKey() === Ext.EventObject.ESC) {
        clearFilter();
    } else {
        var re = new RegExp(".*" + text + ".*", "i");

        tree.filterBy(function (node) {
            return re.test(node.data.text);
        });
    }
};

//For Clear the left tree
var clearFilter = function () {

    var field = App.TriggerField1,
                tree = App.TreePanel1;

    field.setValue("");
    tree.clearFilter(true);
    tree.getView().focus();
};

//For load pages in centeral panel
var loadPage = function (tabPanel, record) {
    var tab = tabPanel.getComponent(record.getId());
    if (!tab) {
        tab = tabPanel.add({
            id: record.getId(),
            title: record.data.text,
            closable: true,
            loader: {
                url: record.data.href,
                renderer: "frame",
                loadMask: {
                    showMask: true,
                    msg: "Loading " + record.data.href + "..."
                }
            },
            autoScroll: true
        });
    }

    tabPanel.setActiveTab(tab);
};

var tipRenderer = function (storeItem, item) {
    //calculate percentage.
    var total = 0;

    App.Chart1.getStore().each(function (rec) {
        total += rec.get('TotalProduction');
    });

    this.setTitle(storeItem.get('Name') + ': ' + Math.round(storeItem.get('TotalProduction') / total * 100) + '%');
};

var saveChart = function (btn) {
    Ext.MessageBox.confirm('Confirm Download', 'Would you like to download the chart as an image?', function (choice) {
        if (choice == 'yes') {
            btn.up('panel').down('chart').save({
                type: 'image/png'
            });
        }
    });
};

var template = '<span style="color:{0};">{1}</span>';

var change = function (value) {
    return Ext.String.format(template, (value > 0) ? "green" : "red", value);
};

var pctChange = function (value) {
    return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
};




var filterTree2 = function (tf, e) {

    var tree = App.TreePanel2,
                text = tf.getRawValue();

    tree.clearFilter();

    if (Ext.isEmpty(text, false)) {
        return;
    }

    if (e.getKey() === Ext.EventObject.ESC) {
        clearFilter2();
    } else {
        var re = new RegExp(".*" + text + ".*", "i");

        tree.filterBy(function (node) {
            return re.test(node.data.text);
        });
    }
};

//For Clear the left tree
var clearFilter2 = function () {

    var field = App.TriggerField2,
                tree = App.TreePanel2;

    field.setValue("");
    tree.clearFilter(true);
    tree.getView().focus();
};