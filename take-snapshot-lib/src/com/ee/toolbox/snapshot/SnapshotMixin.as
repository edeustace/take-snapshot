package com.ee.toolbox.snapshot
{
    import flash.display.DisplayObject;
    import flash.display.InteractiveObject;
    import flash.events.ContextMenuEvent;
    import flash.events.Event;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;

    import mx.core.Application;
    import mx.events.FlexEvent;
    import mx.managers.ISystemManager;
    import mx.managers.PopUpManager;


    [Mixin]
    public class SnapshotMixin
    {
        private static var snapshotMixin:SnapshotMixin;

        public static function init(systemManager:ISystemManager):void
        {
            systemManager.addEventListener(FlexEvent.APPLICATION_COMPLETE, applicationCompleteHandler);
        }

        private static function applicationCompleteHandler(event:Event):void
        {
            var systemManager:InteractiveObject = event.target as InteractiveObject;
            systemManager.removeEventListener(FlexEvent.APPLICATION_COMPLETE, applicationCompleteHandler);
            snapshotMixin = new SnapshotMixin(systemManager);
        }

        public function SnapshotMixin(target:InteractiveObject)
        {
            createContextMenu(target);
        }

        private function createContextMenu(target:InteractiveObject):void
        {
            var contextMenu:ContextMenu = target.contextMenu;
            contextMenu.customItems = [ createContextMenuItem()];
        }

        private function createContextMenuItem():ContextMenuItem
        {
            var contextItem:ContextMenuItem = new ContextMenuItem("Take Snapshot");
            contextItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, handleContextMenuItemSelect);

            return contextItem;
        }

        private function handleContextMenuItemSelect(event:ContextMenuEvent):void
        {

            trace("handleContextMenuItemSelect");

            var popup:ChooseSnapshotTarget = new ChooseSnapshotTarget();
            popup.target = event.mouseTarget;
            PopUpManager.addPopUp(popup, Application.application as DisplayObject, true);
            PopUpManager.centerPopUp(popup);
        }
    }
}
