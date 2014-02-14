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