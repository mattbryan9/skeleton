import { Component, ChangeDetectionStrategy } from '@angular/core';
import { BASECOMPONENT } from '../base/my-comp.component';

@Component({
	selector: 'KEBAB',
	templateUrl: '../base/KEBAB.component.html',
	styleUrls: ['../base/KEBAB.component.scss'],
	changeDetection: ChangeDetectionStrategy.OnPush
})
export class COMPONENTNAME extends BASECOMPONENT { }