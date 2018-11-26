<?php

namespace App\Http\Controllers\API;

use App\Event;
use App\Http\Controllers\Controller;
use Debugbar;
use Illuminate\Http\Request;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $event = Event::paginate(3);
            return response()->success($event);
        } catch (Exception $e) {
            Debugbar::addThrowable($e);
            return response()->exception($e->getMessage(), $e->getCode());
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $this->validate($request, [
                'title'      => 'required',
                'description' => 'required',
            ]);
            $event = Event::create($request->all());
            if ($request->hasFile('image')) {
                $image           = $request->file('image');
                $name            = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/event');
                $image->move($destinationPath, $name);
                $event->image = url('/') . '/event/' . $name;
                $event->save();
            }
            if ($event) {
                return response()->success($event, 200);
            } else {
                return response()->error($event, 400);
            }
        } catch (Exception $e) {
            Debugbar::addThrowable($e);
            return response()->exception($e->getMessage(), $e->getCode());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $event = Event::find($id);
            return response()->success($event);
        } catch (Exception $e) {
            Debugbar::addThrowable($e);
            return response()->exception($e->getMessage(), $e->getCode());
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            /*$event              = new Event;
            $event->author      = $request->input('author');
            $event->description = $request->input('description');
            $event->save();*/
            $event = Event::findorFail($id);
            $event = $event->update($request->all());
            return response()->success($event);
        } catch (Exception $e) {
            Debugbar::addThrowable($e);
            return response()->exception($e->getMessage(), $e->getCode());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $event = Event::find($id);
            $res  = $event->delete();
            return response()->success($res);
        } catch (Exception $e) {
            Debugbar::addThrowable($e);
            return response()->exception($e->getMessage(), $e->getCode());
        }
    }
}
