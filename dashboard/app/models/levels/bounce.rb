# == Schema Information
#
# Table name: levels
#
#  id                    :integer          not null, primary key
#  game_id               :integer
#  name                  :string(255)      not null
#  created_at            :datetime
#  updated_at            :datetime
#  level_num             :string(255)
#  ideal_level_source_id :integer
#  user_id               :integer
#  properties            :text(65535)
#  type                  :string(255)
#  md5                   :string(255)
#  published             :boolean          default(FALSE), not null
#  notes                 :text(65535)
#  audit_log             :text(65535)
#
# Indexes
#
#  index_levels_on_game_id  (game_id)
#  index_levels_on_name     (name)
#

class Bounce < Grid
  serialized_attrs %w(
    ball_direction
    fail_on_ball_exit
    failure_condition
    goal
    min_workspace_height
    scale
    soft_buttons
    success_condition
    theme
    timeout_failure_tick
    use_flag_goal
  )

  def self.soft_buttons
    %w(
      leftButton
      rightButton
      downButton
      upButton
    )
  end

  def self.themes
    %w(retro basketball soccer hockey football)
  end

  # List of possible skins, the first is used as a default.
  def self.skins
    %w(bounce basketball sports)
  end

  def self.create_from_level_builder(params, level_params)
    puts params
    puts level_params
    create!(
      level_params.merge(
        user: params[:user],
        game: Game.bounce,
        level_num: 'custom',
      )
    )
  end

  def toolbox(type)
    <<-XML.strip_heredoc.chomp
      <block type="bounce_moveLeft"></block>
      <block type="bounce_moveRight"></block>
      <block type="bounce_bounceBall"></block>
      <block type="bounce_playSound"></block>
      <block type="bounce_incrementPlayerScore"></block>
      <block type="bounce_incrementOpponentScore"></block>
      <block type="bounce_launchBall"></block>
      <block type="bounce_setTeam"></block>
      <block type="bounce_setPaddleSpeed"></block>
      <block type="bounce_setPaddleDropdown"></block>
      <block type="bounce_setBackground"></block>
      <block type="bounce_setBall"></block>
      <block type="bounce_setPaddle"></block>
      <block type="bounce_setBallSpeed"></block>
    XML
  end
end
