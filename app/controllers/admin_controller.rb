class AdminController < ApplicationController
    def index
        if user_signed_in?
            @infomails = InfoMail.order(created_at: :desc)
            render :index
        else
            redirect_to new_user_session_path
        end
    end

    def destroy
        if user_signed_in?
            @infomail = InfoMail.find(params[:id])
            @infomail.destroy
            redirect_to action: :index
        else
            redirect_to new_user_session_path
        end
    end

    def search
        if user_signed_in?
            @word = params[:word]
            @start_date = params[:start_date]
            @end_date = params[:end_date]

            query = InfoMail.all

            # キーワード検索条件
            if @word != ""
                query = query.where("sender LIKE :word OR mail_address LIKE :word OR message LIKE :word", word: "%#{@word}%")
            end

            # 日付範囲検索条件
            if @start_date != ""
                query = query.where("created_at >= ?", @start_date)
            end
            if @end_date != ""
                query = query.where("created_at <= ?", @end_date)
            end

            # 並び替えと結果の代入
            @infomails = query.order(created_at: :desc)

            render :index
        else
            redirect_to new_user_session_path
        end
    end

    def open
        if user_signed_in?
            @infomail = InfoMail.find(params[:id])
            @infomail.check_flag = true

            if @infomail.save
                mail = {sender: @infomail.sender, mail_address: @infomail.mail_address, message: @infomail.message, created_at: @infomail.created_at}    
                render json: mail
            else
                render json: 'no data'
            end
        else
            redirect_to new_user_session_path
        end
    end
end