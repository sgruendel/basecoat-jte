package com.basecoatui.jte.util;

import gg.jte.Content;

import java.util.List;
import java.util.Map;

// TODO replace BasecoatTab.* class with this
public sealed interface BasecoatItem {

    // ITEM, GROUP, SEPARATOR, SUBMENU
    record Group(
            String id, // optional
            Map<?, ?> attrs,
            String label,
            List<BasecoatItem> items) implements BasecoatItem {
    }

    record Item(
            String url,
            boolean current,
            Map<?, ?> attrs,
            Content icon,
            String label,
            Content content) implements BasecoatItem {

        static Item of(final String url, final Content icon, final String label) {

            return new Item(url, false, null, icon, label, null);
        }

        static Item of(final String url, final Map<?, ?> attrs, final Content icon, final String label) {

            return new Item(url, false, attrs, icon, label, null);
        }

        static Item of(final String url, final Map<?, ?> attrs, final Content content) {

            return new Item(url, false, attrs, null, null, content);
        }

        static Item of(final String url, final Content content) {

            return new Item(url, false, null, null, null, content);
        }

        static Item current(final String url, final Content icon, final String label) {

            return new Item(url, true, null, icon, label, null);
        }

        static Item current(final String url, final Map<?, ?> attrs, final Content icon, final String label) {

            return new Item(url, true, attrs, icon, label, null);
        }

        static Item current(final String url, final Content content) {

            return new Item(url, true, null, null, null, content);
        }

        static Item current(final String url, final Map<?, ?> attrs, final Content content) {

            return new Item(url, true, attrs, null, null, content);
        }
    }

    record Submenu(
            String id,
            boolean open,
            Map<?, ?> attrs,
            Content icon,
            String label,
            List<BasecoatItem> items) implements BasecoatItem {
    }

    record Separator() implements BasecoatItem {
    }

}
