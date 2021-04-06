class TagsController < ApplicationController
  def index
    @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
 
    @jobs = params[:tag_name].present? ? Tag.find(params[:tag_name]).jobs.order(created_at: :desc) : Job.all
  end
end
