# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      # Admin can do everything
      can :manage, :all
    else
      # Guest abilities
      return unless user.persisted?

      # User can manage their own setting
      can :manage, Setting, user_id: user.id

      # Project abilities
      can :read, Project do |project|
        project.owner_id == user.id || project.members.include?(user)
      end

      can :create, Project

      can :update, Project do |project|
        project.owner_id == user.id
      end

      can :destroy, Project do |project|
        project.owner_id == user.id
      end

      # Project Member abilities
      can :create, ProjectMember do |pm|
        pm.project.owner_id == user.id
      end

      can :destroy, ProjectMember do |pm|
        pm.project.owner_id == user.id
      end

      # Task abilities
      can :read, Task do |task|
        task.project.owner_id == user.id || task.project.members.include?(user)
      end

      can :create, Task do |task|
        task.project.owner_id == user.id || task.project.members.include?(user)
      end

      can :update, Task do |task|
        task.project.owner_id == user.id || task.project.members.include?(user)
      end

      can :destroy, Task do |task|
        task.project.owner_id == user.id
      end

      # Label abilities
      can :manage, Label do |label|
        label.project.owner_id == user.id || label.project.members.include?(user)
      end

      # Comment abilities
      can :read, Comment do |comment|
        comment.task.project.owner_id == user.id || comment.task.project.members.include?(user)
      end

      can :create, Comment do |comment|
        comment.task.project.owner_id == user.id || comment.task.project.members.include?(user)
      end

      can :update, Comment, user_id: user.id

      can :destroy, Comment do |comment|
        comment.user_id == user.id || comment.task.project.owner_id == user.id
      end
    end
  end
end
