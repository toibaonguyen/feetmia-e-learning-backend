package com.feetmia.backend.entities;

import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class OwnerCourseId implements Serializable {
    private String ownerId;
    private String courseId;
}