# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.selected_class = 'active'
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    primary.item :welcome,      I18n.t('.navigation.home'),     root_path #, options
    primary.item :about_pages,  I18n.t('.navigation.about'),    about_pages_path #, options
    primary.item :news,         I18n.t('.navigation.news'),     news_index_path #, options

    student_category = Category.find_by(slug: 'students')
    if student_category.present?
      # Add an item which has a sub navigation (same params, but with block)
      primary.item :students,   student_category.name,     category_path(student_category.slug), class: 'sub-menu sub-menu-1' do |sub_nav|
        # Add an item to the sub navigation (same params again)
        student_category.children.each do |subcategory|
          sub_nav.item subcategory.slug.to_sym, subcategory.name, category_path(subcategory.slug)
          #sub_nav.dom_class = 'sub-menu sub-menu-1'
        end
      end
    end

    abitura_category = Category.find_by(slug: 'enrollee')
    if abitura_category.present?
      # Add an item which has a sub navigation (same params, but with block)
      primary.item :enrollee, abitura_category.name,     category_path(abitura_category.slug), class: 'sub-menu sub-menu-1' do |sub_nav|
        # Add an item to the sub navigation (same params again)
        abitura_category.children.each do |subcategory|
          sub_nav.item subcategory.slug.to_sym, subcategory.name, category_path(subcategory.slug)
          #sub_nav.dom_class = 'sub-menu sub-menu-1'
        end
      end
    end

    primary.item :documents,  I18n.t('.navigation.documents'), documents_path #, options
    primary.item :contacts,   I18n.t('.navigation.contacts'),  contacts_pages_path #, options

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    #primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    #primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    primary.dom_class = 'nav sf-menu clearfix'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end
end
