package com.feetmia.backend.entities;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(length = 36, nullable = false, updatable = false)
    private String id;

    @Column(nullable = false, unique = true, length = 255)
    private String email;

    @Column(nullable = false, length = 255)
    private String password;

    @Column(nullable = false, name = "full_name", length = 255)
    private String fullName;

    @Column(name = "avatar_url", columnDefinition = "TEXT")
    private String avatarUrl;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "status_id", nullable = false)
    private UserStatus status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by")
    private User createdBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "updated_by")
    private User updatedBy;

    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;


    @OneToMany(mappedBy="user")
    private Set<UserRole> mappedRoles;

    @OneToMany(mappedBy="createdBy")
    private Set<User> createdUsers;

    @OneToMany(mappedBy="updatedBy")
    private Set<User> updatedUsers;

    @OneToMany(mappedBy="createdBy")
    private Set<Role> createdRoles;

    @OneToMany(mappedBy="updatedBy")
    private Set<Role> updatedRoles;

    @OneToMany(mappedBy="createdBy")
    private Set<UserRole> createdUserRoles;

    @OneToMany(mappedBy="updatedBy")
    private Set<UserRole> updatedUserRoles;

    @OneToMany(mappedBy="createdBy")
    private Set<Category> createdCategories;

    @OneToMany(mappedBy="updatedBy")
    private Set<Category> updatedCategories;

    @OneToMany(mappedBy="createdBy")
    private Set<Skill> createdSkills;

    @OneToMany(mappedBy="updatedBy")
    private Set<Skill> updatedSkills;

    @OneToMany(mappedBy="createdBy")
    private Set<JobRole> createdJobRoles;

    @OneToMany(mappedBy="updatedBy")
    private Set<JobRole> updatedJobRoles;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseStatus> createdCourseStatuses;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseStatus> updatedCourseStatuses;

    @OneToMany(mappedBy="instructor")
    private Set<Course> taughtCourses;

    @OneToMany(mappedBy="updatedBy")
    private Set<Course> updatedCourse;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseRequirement> createdCourseRequirements;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseRequirement> updatedCourseRequirements;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseTargetAudience> createdCourseTargetAudiences;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseTargetAudience> updatedCourseTargetAudiences;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseLearningOutcome> createdCourseLearningOutcomes;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseLearningOutcome> updatedCourseLearningOutcomes;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseModule> createdCourseModules;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseModule> updatedCourseModules;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseLecture> createdCourseLectures;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseLecture> updatedCourseLectures;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseCategory> createdCourseCategories;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseCategory> updatedCourseCategories;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseSkill> createdCourseSkills;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseSkill> updatedCourseSkills;

    @OneToMany(mappedBy="createdBy")
    private Set<CourseJobRole> createdCourseJobRoles;

    @OneToMany(mappedBy="updatedBy")
    private Set<CourseJobRole> updatedCourseJobRoles;

    @OneToMany(mappedBy = "owner")
    private Set<OwnerCourse> ownedCourses;

    @OneToMany(mappedBy="user")
    private Set<CourseRating> ratedCourses;

}