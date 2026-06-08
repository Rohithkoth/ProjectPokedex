// =============================================================
//  hooks/useInfiniteScroll.js
// =============================================================
//
//  WHAT THIS FILE IS:
//  A custom hook that detects when a sentinel element enters
//  the viewport and calls a callback to load more data.
//
//  HOW IT WORKS:
//  Uses the browser's IntersectionObserver API — much more
//  efficient than listening to scroll events. You place an
//  invisible sentinel div at the bottom of your list. When
//  that div scrolls into view, the observer fires and calls
//  onIntersect() to load the next page.
//
//  PARAMS:
//  onIntersect → function to call when sentinel is visible
//  enabled     → boolean — stop observing when false
//                (e.g. when on the last page)
//
//  RETURNS:
//  sentinelRef → attach this ref to your sentinel div
//
//  USAGE:
//  const sentinelRef = useInfiniteScroll(loadMore, hasMore && !loading)
//  <div ref={sentinelRef} />
// =============================================================

import { useEffect, useRef } from 'react'

export function useInfiniteScroll(onIntersect, enabled) {
  const sentinelRef = useRef(null)

  useEffect(() => {
    // Don't observe if disabled — e.g. already on last page
    // or still loading
    if (!enabled) return

    const observer = new IntersectionObserver(
      (entries) => {
        // entries[0] is our sentinel element
        if (entries[0].isIntersecting) {
          onIntersect()
        }
      },
      {
        // Fire when sentinel is 200px from entering viewport
        // gives a head start on loading before user hits bottom
        rootMargin: '200px'
      }
    )

    const sentinel = sentinelRef.current
    if (sentinel) observer.observe(sentinel)

    // Cleanup — stop observing when component unmounts
    // or when enabled/onIntersect changes
    return () => {
      if (sentinel) observer.unobserve(sentinel)
    }
  }, [onIntersect, enabled])

  return sentinelRef
}
