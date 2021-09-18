# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  # GET /reports/1 or /reports/1.json
  def show;
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports or /reports.json
  def create
    @report = current_user.reports.build(report_params)
      if @report.save
        redirect_to @report, notice: t('controllers.common.notice_create', name: t('report'))
      else
        render action: "new", status: :unprocessable_entity
      end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
      if @report.update(report_params)
        redirect_to @report, notice: t('controllers.common.notice_update', name: t('report'))
      else
        render action:"edit", status: :unprocessable_entity
      end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy
      redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: t('report'))
    # else
    #   redirect_to reports_url
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @reports = current_user.reports
    @report = @reports.find_by(id:params[:id])
    redirect_to new_report_path unless @report
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :content)
  end
end
