require "administrate/base_dashboard"

class GroupDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sector: Field::BelongsTo,
    members: Field::HasMany,
    member: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    day: Field::String,
    hour: Field::String,
    classes: Field::Number,
    active: Field::Boolean,
    context: Field::String,
    place: Field::String,
    phone: Field::String,
    comments: Field::Text,
    leader_id: Field::Number,
    dependent_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :sector,
    :members,
    :member,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :sector,
    :members,
    :member,
    :id,
    :name,
    :day,
    :hour,
    :classes,
    :active,
    :context,
    :place,
    :phone,
    :comments,
    :leader_id,
    :dependent_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sector,
    :members,
    :member,
    :name,
    :day,
    :hour,
    :classes,
    :active,
    :context,
    :place,
    :phone,
    :comments,
    :leader_id,
    :dependent_id,
  ].freeze

  # Overwrite this method to customize how groups are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(group)
  #   "Group ##{group.id}"
  # end
end
