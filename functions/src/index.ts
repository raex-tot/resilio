import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import OpenAI from 'openai';

admin.initializeApp();

// Prefer environment variable for API key; fail fast with a helpful error if missing
const openaiApiKey = process.env.OPENAI_API_KEY;
const openai = new OpenAI({ apiKey: openaiApiKey });

export const recommendSkills = functions
  .region('us-central1')
  .https.onCall(async (data, context) => {
    const uid = context.auth?.uid;
    if (!uid) {
      throw new functions.https.HttpsError('unauthenticated', 'Login required');
    }
    if (!openaiApiKey) {
      throw new functions.https.HttpsError(
        'failed-precondition',
        'Server misconfigured: OPENAI_API_KEY is not set.'
      );
    }

    try {
      const resp = await openai.chat.completions.create({
        model: 'gpt-4o-mini',
        messages: [
          { role: 'system', content: 'You recommend DBT skills succinctly.' },
          { role: 'user', content: 'placeholder prompt' }
        ],
        temperature: 0.2,
      });

      const content = resp.choices?.[0]?.message?.content ?? '';
      return { recommendations: content };
    } catch (error) {
      throw new functions.https.HttpsError('internal', 'Failed to get recommendations');
    }
  });

export const generateWeeklyReport = functions
  .region('us-central1')
  .https.onCall(async (data, context) => {
    // TODO: summarise data and store in reports collection
    return { ok: true };
  });

export const createTherapistClientLink = functions
  .region('us-central1')
  .https.onCall(async (data, context) => {
    // TODO: check consent and create document
    return { ok: true };
  });

export const exportPdf = functions
  .region('us-central1')
  .https.onCall(async (data, context) => {
    // TODO: generate PDF and store in Storage
    return { ok: true };
  });
