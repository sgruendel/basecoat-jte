package com.basecoatui.jte.util;

import gg.jte.Content;

import java.util.List;
import java.util.Map;


public record BasecoatCommand() {

    public enum ItemType {
        ITEM, GROUP, SEPARATOR
    }

    public record Item(
            ItemType type,
            String id,
            String label,
            String url,
            String keywords,
            boolean disabled,
            List<Item> items,
            Map<?, ?> attrs,
            Content icon
    ) {

        public static final Item SEPARATOR = new Item(ItemType.SEPARATOR, null, null, null, null, false, null, null, null);

        public static Item of(final String label) {

            return new Item(ItemType.ITEM, null, label, null, null, false, null, null, null);
        }

        public static Item of(final String label, final String url) {

            return new Item(ItemType.ITEM, null, label, url, null, false, null, null, null);
        }

        public static Item group(final String label, final List<Item> items) {

            return new Item(ItemType.GROUP, null, label, null, null, false, items, null, null);
        }

    }

}
