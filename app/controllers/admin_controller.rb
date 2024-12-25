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

            if @word != ""
                if @start_date != "" && @end_date != ""
                    @infomails = InfoMail.where("(sender LIKE ? OR mail_address LIKE ? OR message LIKE ?) AND created_at >= ? AND created_at <= ?", "%#{@word}%", "%#{@word}%", "%#{@word}%","%#{@start_date}%", "%#{@end_date}%").order(created_at: :desc)
                elsif @start_date != "" && @end_date == ""
                    @infomails = InfoMail.where("(sender LIKE ? OR mail_address LIKE ? OR message LIKE ?) AND created_at >= ?", "%#{@word}%", "%#{@word}%", "%#{@word}%","%#{@start_date}%").order(created_at: :desc)
                elsif @start_date == "" && @end_date != ""
                    @infomails = InfoMail.where("(sender LIKE ? OR mail_address LIKE ? OR message LIKE ?) AND created_at <= ?", "%#{@word}%", "%#{@word}%", "%#{@word}%", "%#{@end_date}%").order(created_at: :desc)
                else
                    @infomails = InfoMail.where("sender LIKE ? OR mail_address LIKE ? OR message LIKE ?", "%#{@word}%", "%#{@word}%", "%#{@word}%").order(created_at: :desc)
                end
            else
                if @start_date != "" && @end_date != ""
                    @infomails = InfoMail.where("created_at >= ? AND created_at <= ?","%#{@start_date}%", "%#{@end_date}%").order(created_at: :desc)
                elsif @start_date != "" && @end_date == ""
                    @infomails = InfoMail.where("created_at >= ?", "%#{@start_date}%").order(created_at: :desc)
                elsif @start_date == "" && @end_date != ""
                    @infomails = InfoMail.where("created_at <= ?", "%#{@end_date}%").order(created_at: :desc)
                else
                    @infomails = InfoMail.order(created_at: :desc)
                end
            end
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