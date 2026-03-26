import { module, test } from 'qunit';
import { setupRenderingTest } from 'task-manager/tests/helpers';
import { render } from '@ember/test-helpers';
import TaskList from 'task-manager/components/task-list';

module('Integration | Component | task-list', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Updating values is achieved using autotracking, just like in app code. For example:
    // class State { @tracked myProperty = 0; }; const state = new State();
    // and update using state.myProperty = 1; await rerender();
    // Handle any actions with function myAction(val) { ... };

    await render(<template><TaskList /></template>);

    assert.dom().hasText('');

    // Template block usage:
    await render(
      <template>
        <TaskList>
          template block text
        </TaskList>
      </template>
    );

    assert.dom().hasText('template block text');
  });
});
