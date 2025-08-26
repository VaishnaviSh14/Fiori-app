sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        actionTestHandler: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        },
        Type: function() {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
