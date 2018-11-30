import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import {EventService} from "./../event.service";
import { Ng4LoadingSpinnerService } from 'ng4-loading-spinner';
import { NotificationService } from './../../shared';

@Component({
  selector: 'app-events-update',
  templateUrl: './events-update.component.html',
  styleUrls: ['./events-update.component.css']
})
export class EventsUpdateComponent implements OnInit {

  	eventData = {isbn:'', title:'', author:'', description:'', image:''}
  	message = ''
  	constructor(
  		private eventService: EventService, 
  		private router: Router,
  		private route: ActivatedRoute,
  		private location: Location,
      private spinnerService: Ng4LoadingSpinnerService,
      private notificationService: NotificationService
  	) { }

  ngOnInit() {
  	this.getEventById()
  }
  getEventById(){
    this.spinnerService.show();
  	const $id = this.route.snapshot.paramMap.get('id');
    this.eventService.getEventById($id)
      .subscribe((response) => {
        this.eventData = response.data
        this.spinnerService.hide();
    })
  }

  updateEvent() {
    this.spinnerService.show();
  	this.eventService.updateEvent(this.eventData)
      .subscribe((value) => {
        this.spinnerService.hide();
        this.notificationService.onSuccess('Successfully Updated.')
        this.router.navigate(['event']);   
      });
  }
}
