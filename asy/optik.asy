private import geometry;

real rayArrowSize = 1.5mm;
pen mirrorColor = gray(0.85);
real mirrorThickness = 0.5mm;

struct PlanaMirror {

    vector normalDirection;
    point entry;
    line normalLine;
    line surfaceLine;
    transform t;


    /**
     * create a PlanaMirror.
     * @param normalDirection direction of normal line
     * @param entry the (default) entry point of the incomming ray
     */
    void operator init(vector normalDirection=(0, 1), point entry = (0,0)) {
        this.normalDirection = normalDirection;
        this.entry = entry;
        this.normalLine = line(this.entry, false, this.entry+normalDirection);
        this.surfaceLine = perpendicular(this.entry, this.normalDirection);
        this.t = reflect( normalLine );
    }

    /**
     * calculate the reflected ray of a entry ray from given source to the (default) entry
     * point of this mirror
     */
    line refectedRay(point source) {
        point target = this.t * source;
        line l = line(this.entry, false, target);
        return l;
    }

    /**
     *
     */
    PlanaMirror drawMirror(real leftWidth, real rightWidth=leftWidth, real normalLength=leftWidth) {
        point mostLeft = curpoint(this.surfaceLine, leftWidth);

        vector offsetP = -mirrorThickness * unit(this.normalDirection);
        point leftOffset = mostLeft + offsetP;
        //dot("mostleft", mostLeft);

        point mostRight = curpoint(this.surfaceLine, -rightWidth);
        point rightOffset = mostRight + offsetP;
        //dot("mostright", mostRight);

        segment mSurface = segment(mostLeft, mostRight);
        fill( mostLeft -- leftOffset -- rightOffset -- mostRight -- cycle, defaultpen + mirrorColor );
        draw( mSurface );
        //dot(entry);
        segment mNormal = segment(entry + offsetP, entry);//
        draw( mNormal, defaultpen  );
        segment trueNormal = segment(entry, entry + normalLength*unit(normalDirection));
        draw( trueNormal, defaultpen + (dashed*0.5) );

        return this;
    }

    PlanaMirror drawEntryRay(point source, real arrowPosition=0){
        line entryRay = line(source, false, this.entry, false);
        draw(
            entryRay,
            arrow=Arrow(rayArrowSize, position=arrowPosition)
        );
        return this;
    }

    PlanaMirror drawReflectedRay(point source, real arrowPosition=1, real rayLength=0 ) {
        line ray = this.refectedRay(source);
        if(rayLength > 0) {
            point target = curpoint(ray, rayLength);
            ray = line(this.entry, false, target, false);
        }
        draw(
            ray,
            arrow=Arrow(rayArrowSize, position=arrowPosition)
        );
        return this;
    }

    PlanaMirror labelMirror(){
        write("TODO");
        return this;
    }
}
