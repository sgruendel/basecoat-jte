package com.basecoatui.jte.util;

import gg.jte.Content;

import java.util.List;
import java.util.Map;


public record BasecoatSelect() {

    public enum ItemType {
        ITEM, GROUP, SEPARATOR
    }

    public record Item(ItemType type, String label, String value, List<Item> items, Map<?, ?> attrs, String url, Content icon) {

        public static final Item SEPARATOR = new Item(ItemType.SEPARATOR, null, null, null, null, null, null);

        public static Item of(final String label) {

            return new Item(ItemType.ITEM, label, null, null, null, null, null);
        }

        public static Item of(final String label, final String value) {

            return new Item(ItemType.ITEM, label, value, null, null, null, null);
        }

        public static Item of(final String label, final List<Item> items) {

            return new Item(ItemType.GROUP, label, null, items, null, null, null);
        }

    }

}
