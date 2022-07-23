defmodule PortalTest do
  use ExUnit.Case, async: true
  doctest Portal

  setup_all do
    # Create left and right doors
    {:ok, _} = Portal.shoot(:orange)
    {:ok, _} = Portal.shoot(:blue)

    # Create the door
    portal = Portal.transfer(:orange, :blue, [1, 2, 3, 4])

    # Add portal to the test context.
    {:ok, [left: :orange, right: :blue, portal: portal]}
  end

  test "should shoot a door" do
    Portal.shoot(:yellow)

    # Check if the door was created.
    assert Portal.Door.get(:yellow)
  end

  test "should populate the left side of the portal", %{portal: portal} do
    left = Portal.Door.get(portal.left)
    right = Portal.Door.get(portal.right)

    # Transfer the data from the left to the right.
    Portal.transfer(portal.left, portal.right, [5])

    # Check that the data is in the right door.
    assert Portal.Door.get(portal.left) == [5] ++ left
    assert Portal.Door.get(portal.right) == right
  end

  test "should push data to the right", %{portal: portal} do
    # Get state before pushing.
    [head|tail] = Portal.Door.get(portal.left)

    # Push data to the right.
    Portal.push_right(portal)

    # Check that the data is in the right door.
    assert Portal.Door.get(portal.right) == [head]
    assert Portal.Door.get(portal.left) == tail
  end

  test "should get data to the left", %{portal: portal} do
    Portal.Door.get(portal.left)
  end
end
