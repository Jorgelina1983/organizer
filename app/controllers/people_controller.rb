class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    if session[:id].blank? # || User.find(session[:id]).nil?
      redirect_to '/login'
    end

    if params[:associated]
      @people = Person.where.not(associated_number: nil)
                      .where.not(associated_number: 0)
                      .order(:associated_number)
      @title = 'Asociados'
    elsif params[:travelers]
      @people = Person.where(traveler: true)
                      .order(:last_name)
      @title = 'Viajeros'
    else
      @people = Person.all.order(:last_name)
      @title = 'Personas'
    end

    @lists = List.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to people_url, notice: 'La persona fue creada exitosamente.' }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url, notice: 'La persona fue editada exitosamente.' }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'La persona fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  # POST Add selected person to the selected list.
  def add_to_list
    lists = List.find(params[:person_to_list_id])
    person = Person.find(params[:person][:id])
    person.lists << lists

    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit( :first_name,
                                      :last_name,
                                      :identification,
                                      :benefit,
                                      :cell_phone,
                                      :phone,
                                      :dob,
                                      :address,
                                      :address_number,
                                      :traveler,
                                      :associated_number,
                                      :person_to_list_id )
    end
end
