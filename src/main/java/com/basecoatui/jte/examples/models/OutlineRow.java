package com.basecoatui.jte.examples.models;

public record OutlineRow(
    long id,
    String header,
    String type,
    String status,
    String target,
    String limit,
    String reviewer
) {
}
