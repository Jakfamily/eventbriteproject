class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    # Récupérer tous les événements
    @event = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    # Récupérer l'événement spécifique
  end

  # GET /events/new
  def new
    # Créer une nouvelle instance d'événement
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    # Récupérer l'événement spécifique pour l'édition
    @event = Event.find(params[:id])
  end

  # POST /events or /events.json
  def create
    # Créer un nouvel événement avec les paramètres fournis
    @event = Event.new(event_params)
    @event.admin = current_user
  
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    # Mettre à jour les détails de l'événement avec les paramètres fournis
    redirect_to event_path(@event), notice: "L'événement a été mis à jour avec succès."
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    # Supprimer l'événement spécifié
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Utiliser des rappels pour partager la configuration commune ou les contraintes entre les actions.
    def set_event
      # Trouver l'événement spécifié
      @event = Event.find(params[:id])
    end

    def event_params
      # Paramètres autorisés pour la création ou la mise à jour de l'événement
      params.require(:event).permit(:title, :start_datetime, :duration, :location, :description, :price)
    end
end

