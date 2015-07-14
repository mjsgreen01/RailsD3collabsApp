require 'test_helper'

class SongInvolvementsControllerTest < ActionController::TestCase
  setup do
    @song_involvement = song_involvements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_involvements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_involvement" do
    assert_difference('SongInvolvement.count') do
      post :create, song_involvement: { artist_id: @song_involvement.artist_id, featured: @song_involvement.featured, primary: @song_involvement.primary, producer: @song_involvement.producer, song_id: @song_involvement.song_id }
    end

    assert_redirected_to song_involvement_path(assigns(:song_involvement))
  end

  test "should show song_involvement" do
    get :show, id: @song_involvement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_involvement
    assert_response :success
  end

  test "should update song_involvement" do
    patch :update, id: @song_involvement, song_involvement: { artist_id: @song_involvement.artist_id, featured: @song_involvement.featured, primary: @song_involvement.primary, producer: @song_involvement.producer, song_id: @song_involvement.song_id }
    assert_redirected_to song_involvement_path(assigns(:song_involvement))
  end

  test "should destroy song_involvement" do
    assert_difference('SongInvolvement.count', -1) do
      delete :destroy, id: @song_involvement
    end

    assert_redirected_to song_involvements_path
  end
end
