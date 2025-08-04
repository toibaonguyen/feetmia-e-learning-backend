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
public class CourseJobRoleId implements Serializable {
    private String courseId;
    private String jobRoleId;
}