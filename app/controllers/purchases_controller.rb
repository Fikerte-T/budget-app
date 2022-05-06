class PurchasesController < ApplicationController
    def index
        @user = current_user
        @category = Category.find(params[:category_id])
        @purchases = @category.purchases.order(created_at: :desc)
      end
      def new
      
      end

      def create
        @category = Category.find(params[:category_id])
        @purchase = @category.purchases.new(purchase_params)

        # @purchase = Purchase.new(purchase_params)
        if @purchase.save
            flash.notice = 'Purchase was successfully created.'
            redirect_to user_category_purchases_path(params[:user_id], params[:category_id])
            # redirect_to [@category.user, @category]
          else
            flash.alert = 'Purchase was not created.'
            render :new
          end
      end

      private
      
    def purchase_params
        params.require(:purchase).permit(:name, :amount)
    end
end
