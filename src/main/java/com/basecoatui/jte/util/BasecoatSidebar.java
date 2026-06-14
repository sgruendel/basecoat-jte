package com.basecoatui.jte.util;

import gg.jte.Content;

import java.util.List;
import java.util.Map;


public record BasecoatSidebar() {

    public enum ItemType {
        ITEM, GROUP, SEPARATOR, SUBMENU
    }

    public record Item(
            ItemType type,
            String id,
            String label,
            String url,
            boolean current,
            boolean open,
            List<Item> items,
            Map<?, ?> attrs,
            Content icon
    ) {

        public static final Item SEPARATOR = new Item(ItemType.SEPARATOR, null, null, null, false, false, null, null, null);

        public static Item of(final String label, final String url) {

            return new Item(ItemType.ITEM, null, label, url, false, false, null, null, null);
        }

        public static Item current(final String label, final String url) {

            return new Item(ItemType.ITEM, null, label, url, true, false, null, null, null);
        }

        public static Item group(final String label, final List<Item> items) {

            return new Item(ItemType.GROUP, null, label, null, false, false, items, null, null);
        }

        public static Item submenu(final String label, final List<Item> items) {

            return new Item(ItemType.SUBMENU, null, label, null, false, false, items, null, null);
        }

    }

}
