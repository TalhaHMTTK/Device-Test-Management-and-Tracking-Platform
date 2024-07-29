module SuperAdmin
  class UsersController < ApplicationController

    def all_users
      ActsAsTenant.without_tenant do
        @users = User.order(:id)
      end
    end

  end
end
