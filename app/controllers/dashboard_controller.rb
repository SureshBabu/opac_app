class DashboardController < ApplicationController
  def show
    current_user.current_branch = Branch.branch_from_subdomain(current_user.subdomain)
    @associate_branches = Branch.associate_branches(current_user.subdomain)
  end
end
