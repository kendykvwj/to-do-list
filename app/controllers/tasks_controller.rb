class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]


  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

      if @task.save
        redirect_to @task, notice: "Task criada com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
  end


  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task atualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task removida."
  end

  private
    # Se nao pertence ao usuario da erro
    def set_task
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to tasks_path, alert: "Task nao encontrada." unless @task
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :date, :description)
    end
end
