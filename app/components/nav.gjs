import Component from '@glimmer/component';
import { service } from '@ember/service';
import { LinkTo } from '@ember/routing';

export default class Nav extends Component {
  @service tasks;

  <template>
    <nav class="nav">
      <h1 class="nav__title">📝 Task Manager</h1>
      <div class="nav__links">
        <LinkTo @route="index" class="nav__link">
          Pending
          <span class="nav__badge--pending">
            {{this.tasks.pending.length}}
          </span>
        </LinkTo>
        <LinkTo @route="completed" class="nav__link">
          Completed
          <span class="nav__badge--completed">
            {{this.tasks.completed.length}}
          </span>
        </LinkTo>
      </div>
    </nav>
  </template>
}
